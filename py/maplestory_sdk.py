# Maplestory SDK

from utility.voxgig_struct import voxgig_struct as vs
from core.utility_type import MaplestoryUtility
from core.spec import MaplestorySpec
from core import helpers

# Load utility registration (populates Utility._registrar)
from utility import register

# Load features
from feature.base_feature import MaplestoryBaseFeature
from features import _make_feature


class MaplestorySDK:

    def __init__(self, options=None):
        self.mode = "live"
        self.features = []
        self.options = None

        utility = MaplestoryUtility()
        self._utility = utility

        from config import make_config
        config = make_config()

        self._rootctx = utility.make_context({
            "client": self,
            "utility": utility,
            "config": config,
            "options": options if options is not None else {},
            "shared": {},
        }, None)

        self.options = utility.make_options(self._rootctx)

        if vs.getpath(self.options, "feature.test.active") is True:
            self.mode = "test"

        self._rootctx.options = self.options

        # Add features from config.
        feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
        if feature_opts is not None:
            feature_items = vs.items(feature_opts)
            if feature_items is not None:
                for item in feature_items:
                    fname = item[0]
                    fopts = helpers.to_map(item[1])
                    if fopts is not None and fopts.get("active") is True:
                        utility.feature_add(self._rootctx, _make_feature(fname))

        # Add extension features.
        extend = vs.getprop(self.options, "extend")
        if isinstance(extend, list):
            for f in extend:
                if isinstance(f, dict) or (hasattr(f, "get_name") and callable(f.get_name)):
                    utility.feature_add(self._rootctx, f)

        # Initialize features.
        for f in self.features:
            utility.feature_init(self._rootctx, f)

        utility.feature_hook(self._rootctx, "PostConstruct")

        # #BuildFeatures

    def options_map(self):
        out = vs.clone(self.options)
        if isinstance(out, dict):
            return out
        return {}

    def get_utility(self):
        return MaplestoryUtility.copy(self._utility)

    def get_root_ctx(self):
        return self._rootctx

    def prepare(self, fetchargs=None):
        utility = self._utility

        if fetchargs is None:
            fetchargs = {}

        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "prepare",
            "ctrl": ctrl,
        }, self._rootctx)

        options = self.options

        path = vs.getprop(fetchargs, "path") or ""
        if not isinstance(path, str):
            path = ""

        method = vs.getprop(fetchargs, "method") or "GET"
        if not isinstance(method, str):
            method = "GET"

        params = helpers.to_map(vs.getprop(fetchargs, "params"))
        if params is None:
            params = {}
        query = helpers.to_map(vs.getprop(fetchargs, "query"))
        if query is None:
            query = {}

        headers = utility.prepare_headers(ctx)

        base = vs.getprop(options, "base") or ""
        if not isinstance(base, str):
            base = ""
        prefix = vs.getprop(options, "prefix") or ""
        if not isinstance(prefix, str):
            prefix = ""
        suffix = vs.getprop(options, "suffix") or ""
        if not isinstance(suffix, str):
            suffix = ""

        ctx.spec = MaplestorySpec({
            "base": base,
            "prefix": prefix,
            "suffix": suffix,
            "path": path,
            "method": method,
            "params": params,
            "query": query,
            "headers": headers,
            "body": vs.getprop(fetchargs, "body"),
            "step": "start",
        })

        # Merge user-provided headers.
        uh = vs.getprop(fetchargs, "headers")
        if isinstance(uh, dict):
            for k, v in uh.items():
                ctx.spec.headers[k] = v

        _, err = utility.prepare_auth(ctx)
        if err is not None:
            raise err

        fetchdef, err = utility.make_fetch_def(ctx)
        if err is not None:
            raise err

        return fetchdef

    def direct(self, fetchargs=None):
        utility = self._utility

        try:
            fetchdef = self.prepare(fetchargs)
        except Exception as err:
            # direct() is the raw-HTTP escape hatch: it never raises, it
            # returns a result object callers branch on via result["ok"].
            return {"ok": False, "err": err}

        if fetchargs is None:
            fetchargs = {}
        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "direct",
            "ctrl": ctrl,
        }, self._rootctx)

        url = fetchdef.get("url", "")
        fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

        if fetch_err is not None:
            return {"ok": False, "err": fetch_err}

        if fetched is None:
            return {
                "ok": False,
                "err": ctx.make_error("direct_no_response", "response: undefined"),
            }

        if isinstance(fetched, dict):
            status = helpers.to_int(vs.getprop(fetched, "status"))
            headers = vs.getprop(fetched, "headers") or {}

            # No-body responses (204, 304) and explicit zero content-length
            # must skip JSON parsing — calling json() on an empty body raises.
            content_length = None
            if isinstance(headers, dict):
                content_length = headers.get("content-length")
            no_body = status in (204, 304) or str(content_length) == "0"

            json_data = None
            if not no_body:
                jf = vs.getprop(fetched, "json")
                if callable(jf):
                    try:
                        json_data = jf()
                    except Exception:
                        # Non-JSON body (e.g. text/plain, text/html). Surface
                        # status + headers but leave data as None.
                        json_data = None

            return {
                "ok": status >= 200 and status < 300,
                "status": status,
                "headers": headers,
                "data": json_data,
            }

        return {
            "ok": False,
            "err": ctx.make_error("direct_invalid", "invalid response type"),
        }


    @property
    def android(self):
        """Idiomatic facade: client.android.list() / client.android.load({"id": ...})."""
        from entity.android_entity import AndroidEntity
        cached = getattr(self, "_android", None)
        if cached is None:
            cached = AndroidEntity(self, None)
            self._android = cached
        return cached

    def Android(self, data=None):
        # Deprecated: use client.android instead.
        from entity.android_entity import AndroidEntity
        return AndroidEntity(self, data)


    @property
    def avatar(self):
        """Idiomatic facade: client.avatar.list() / client.avatar.load({"id": ...})."""
        from entity.avatar_entity import AvatarEntity
        cached = getattr(self, "_avatar", None)
        if cached is None:
            cached = AvatarEntity(self, None)
            self._avatar = cached
        return cached

    def Avatar(self, data=None):
        # Deprecated: use client.avatar instead.
        from entity.avatar_entity import AvatarEntity
        return AvatarEntity(self, data)


    @property
    def cache(self):
        """Idiomatic facade: client.cache.list() / client.cache.load({"id": ...})."""
        from entity.cache_entity import CacheEntity
        cached = getattr(self, "_cache", None)
        if cached is None:
            cached = CacheEntity(self, None)
            self._cache = cached
        return cached

    def Cache(self, data=None):
        # Deprecated: use client.cache instead.
        from entity.cache_entity import CacheEntity
        return CacheEntity(self, data)


    @property
    def character(self):
        """Idiomatic facade: client.character.list() / client.character.load({"id": ...})."""
        from entity.character_entity import CharacterEntity
        cached = getattr(self, "_character", None)
        if cached is None:
            cached = CharacterEntity(self, None)
            self._character = cached
        return cached

    def Character(self, data=None):
        # Deprecated: use client.character instead.
        from entity.character_entity import CharacterEntity
        return CharacterEntity(self, data)


    @property
    def chat(self):
        """Idiomatic facade: client.chat.list() / client.chat.load({"id": ...})."""
        from entity.chat_entity import ChatEntity
        cached = getattr(self, "_chat", None)
        if cached is None:
            cached = ChatEntity(self, None)
            self._chat = cached
        return cached

    def Chat(self, data=None):
        # Deprecated: use client.chat instead.
        from entity.chat_entity import ChatEntity
        return ChatEntity(self, data)


    @property
    def cluster(self):
        """Idiomatic facade: client.cluster.list() / client.cluster.load({"id": ...})."""
        from entity.cluster_entity import ClusterEntity
        cached = getattr(self, "_cluster", None)
        if cached is None:
            cached = ClusterEntity(self, None)
            self._cluster = cached
        return cached

    def Cluster(self, data=None):
        # Deprecated: use client.cluster instead.
        from entity.cluster_entity import ClusterEntity
        return ClusterEntity(self, data)


    @property
    def diff(self):
        """Idiomatic facade: client.diff.list() / client.diff.load({"id": ...})."""
        from entity.diff_entity import DiffEntity
        cached = getattr(self, "_diff", None)
        if cached is None:
            cached = DiffEntity(self, None)
            self._diff = cached
        return cached

    def Diff(self, data=None):
        # Deprecated: use client.diff instead.
        from entity.diff_entity import DiffEntity
        return DiffEntity(self, data)


    @property
    def entity1(self):
        """Idiomatic facade: client.entity1.list() / client.entity1.load({"id": ...})."""
        from entity.entity1_entity import Entity1Entity
        cached = getattr(self, "_entity1", None)
        if cached is None:
            cached = Entity1Entity(self, None)
            self._entity1 = cached
        return cached

    def Entity1(self, data=None):
        # Deprecated: use client.entity1 instead.
        from entity.entity1_entity import Entity1Entity
        return Entity1Entity(self, data)


    @property
    def gms_new(self):
        """Idiomatic facade: client.gms_new.list() / client.gms_new.load({"id": ...})."""
        from entity.gms_new_entity import GmsNewEntity
        cached = getattr(self, "_gms_new", None)
        if cached is None:
            cached = GmsNewEntity(self, None)
            self._gms_new = cached
        return cached

    def GmsNew(self, data=None):
        # Deprecated: use client.gms_new instead.
        from entity.gms_new_entity import GmsNewEntity
        return GmsNewEntity(self, data)


    @property
    def guild_mark(self):
        """Idiomatic facade: client.guild_mark.list() / client.guild_mark.load({"id": ...})."""
        from entity.guild_mark_entity import GuildMarkEntity
        cached = getattr(self, "_guild_mark", None)
        if cached is None:
            cached = GuildMarkEntity(self, None)
            self._guild_mark = cached
        return cached

    def GuildMark(self, data=None):
        # Deprecated: use client.guild_mark instead.
        from entity.guild_mark_entity import GuildMarkEntity
        return GuildMarkEntity(self, data)


    @property
    def health(self):
        """Idiomatic facade: client.health.list() / client.health.load({"id": ...})."""
        from entity.health_entity import HealthEntity
        cached = getattr(self, "_health", None)
        if cached is None:
            cached = HealthEntity(self, None)
            self._health = cached
        return cached

    def Health(self, data=None):
        # Deprecated: use client.health instead.
        from entity.health_entity import HealthEntity
        return HealthEntity(self, data)


    @property
    def item(self):
        """Idiomatic facade: client.item.list() / client.item.load({"id": ...})."""
        from entity.item_entity import ItemEntity
        cached = getattr(self, "_item", None)
        if cached is None:
            cached = ItemEntity(self, None)
            self._item = cached
        return cached

    def Item(self, data=None):
        # Deprecated: use client.item instead.
        from entity.item_entity import ItemEntity
        return ItemEntity(self, data)


    @property
    def job(self):
        """Idiomatic facade: client.job.list() / client.job.load({"id": ...})."""
        from entity.job_entity import JobEntity
        cached = getattr(self, "_job", None)
        if cached is None:
            cached = JobEntity(self, None)
            self._job = cached
        return cached

    def Job(self, data=None):
        # Deprecated: use client.job instead.
        from entity.job_entity import JobEntity
        return JobEntity(self, data)


    @property
    def map(self):
        """Idiomatic facade: client.map.list() / client.map.load({"id": ...})."""
        from entity.map_entity import MapEntity
        cached = getattr(self, "_map", None)
        if cached is None:
            cached = MapEntity(self, None)
            self._map = cached
        return cached

    def Map(self, data=None):
        # Deprecated: use client.map instead.
        from entity.map_entity import MapEntity
        return MapEntity(self, data)


    @property
    def metric(self):
        """Idiomatic facade: client.metric.list() / client.metric.load({"id": ...})."""
        from entity.metric_entity import MetricEntity
        cached = getattr(self, "_metric", None)
        if cached is None:
            cached = MetricEntity(self, None)
            self._metric = cached
        return cached

    def Metric(self, data=None):
        # Deprecated: use client.metric instead.
        from entity.metric_entity import MetricEntity
        return MetricEntity(self, data)


    @property
    def mob(self):
        """Idiomatic facade: client.mob.list() / client.mob.load({"id": ...})."""
        from entity.mob_entity import MobEntity
        cached = getattr(self, "_mob", None)
        if cached is None:
            cached = MobEntity(self, None)
            self._mob = cached
        return cached

    def Mob(self, data=None):
        # Deprecated: use client.mob instead.
        from entity.mob_entity import MobEntity
        return MobEntity(self, data)


    @property
    def music(self):
        """Idiomatic facade: client.music.list() / client.music.load({"id": ...})."""
        from entity.music_entity import MusicEntity
        cached = getattr(self, "_music", None)
        if cached is None:
            cached = MusicEntity(self, None)
            self._music = cached
        return cached

    def Music(self, data=None):
        # Deprecated: use client.music instead.
        from entity.music_entity import MusicEntity
        return MusicEntity(self, data)


    @property
    def name(self):
        """Idiomatic facade: client.name.list() / client.name.load({"id": ...})."""
        from entity.name_entity import NameEntity
        cached = getattr(self, "_name", None)
        if cached is None:
            cached = NameEntity(self, None)
            self._name = cached
        return cached

    def Name(self, data=None):
        # Deprecated: use client.name instead.
        from entity.name_entity import NameEntity
        return NameEntity(self, data)


    @property
    def npc(self):
        """Idiomatic facade: client.npc.list() / client.npc.load({"id": ...})."""
        from entity.npc_entity import NpcEntity
        cached = getattr(self, "_npc", None)
        if cached is None:
            cached = NpcEntity(self, None)
            self._npc = cached
        return cached

    def Npc(self, data=None):
        # Deprecated: use client.npc instead.
        from entity.npc_entity import NpcEntity
        return NpcEntity(self, data)


    @property
    def nxf(self):
        """Idiomatic facade: client.nxf.list() / client.nxf.load({"id": ...})."""
        from entity.nxf_entity import NxfEntity
        cached = getattr(self, "_nxf", None)
        if cached is None:
            cached = NxfEntity(self, None)
            self._nxf = cached
        return cached

    def Nxf(self, data=None):
        # Deprecated: use client.nxf instead.
        from entity.nxf_entity import NxfEntity
        return NxfEntity(self, data)


    @property
    def performance_metric(self):
        """Idiomatic facade: client.performance_metric.list() / client.performance_metric.load({"id": ...})."""
        from entity.performance_metric_entity import PerformanceMetricEntity
        cached = getattr(self, "_performance_metric", None)
        if cached is None:
            cached = PerformanceMetricEntity(self, None)
            self._performance_metric = cached
        return cached

    def PerformanceMetric(self, data=None):
        # Deprecated: use client.performance_metric instead.
        from entity.performance_metric_entity import PerformanceMetricEntity
        return PerformanceMetricEntity(self, data)


    @property
    def pet(self):
        """Idiomatic facade: client.pet.list() / client.pet.load({"id": ...})."""
        from entity.pet_entity import PetEntity
        cached = getattr(self, "_pet", None)
        if cached is None:
            cached = PetEntity(self, None)
            self._pet = cached
        return cached

    def Pet(self, data=None):
        # Deprecated: use client.pet instead.
        from entity.pet_entity import PetEntity
        return PetEntity(self, data)


    @property
    def quest(self):
        """Idiomatic facade: client.quest.list() / client.quest.load({"id": ...})."""
        from entity.quest_entity import QuestEntity
        cached = getattr(self, "_quest", None)
        if cached is None:
            cached = QuestEntity(self, None)
            self._quest = cached
        return cached

    def Quest(self, data=None):
        # Deprecated: use client.quest instead.
        from entity.quest_entity import QuestEntity
        return QuestEntity(self, data)


    @property
    def system(self):
        """Idiomatic facade: client.system.list() / client.system.load({"id": ...})."""
        from entity.system_entity import SystemEntity
        cached = getattr(self, "_system", None)
        if cached is None:
            cached = SystemEntity(self, None)
            self._system = cached
        return cached

    def System(self, data=None):
        # Deprecated: use client.system instead.
        from entity.system_entity import SystemEntity
        return SystemEntity(self, data)


    @property
    def tip(self):
        """Idiomatic facade: client.tip.list() / client.tip.load({"id": ...})."""
        from entity.tip_entity import TipEntity
        cached = getattr(self, "_tip", None)
        if cached is None:
            cached = TipEntity(self, None)
            self._tip = cached
        return cached

    def Tip(self, data=None):
        # Deprecated: use client.tip instead.
        from entity.tip_entity import TipEntity
        return TipEntity(self, data)


    @property
    def wzn(self):
        """Idiomatic facade: client.wzn.list() / client.wzn.load({"id": ...})."""
        from entity.wzn_entity import WznEntity
        cached = getattr(self, "_wzn", None)
        if cached is None:
            cached = WznEntity(self, None)
            self._wzn = cached
        return cached

    def Wzn(self, data=None):
        # Deprecated: use client.wzn instead.
        from entity.wzn_entity import WznEntity
        return WznEntity(self, data)


    @property
    def wzn2(self):
        """Idiomatic facade: client.wzn2.list() / client.wzn2.load({"id": ...})."""
        from entity.wzn2_entity import Wzn2Entity
        cached = getattr(self, "_wzn2", None)
        if cached is None:
            cached = Wzn2Entity(self, None)
            self._wzn2 = cached
        return cached

    def Wzn2(self, data=None):
        # Deprecated: use client.wzn2 instead.
        from entity.wzn2_entity import Wzn2Entity
        return Wzn2Entity(self, data)


    @property
    def wzn3(self):
        """Idiomatic facade: client.wzn3.list() / client.wzn3.load({"id": ...})."""
        from entity.wzn3_entity import Wzn3Entity
        cached = getattr(self, "_wzn3", None)
        if cached is None:
            cached = Wzn3Entity(self, None)
            self._wzn3 = cached
        return cached

    def Wzn3(self, data=None):
        # Deprecated: use client.wzn3 instead.
        from entity.wzn3_entity import Wzn3Entity
        return Wzn3Entity(self, data)


    @property
    def wzn4(self):
        """Idiomatic facade: client.wzn4.list() / client.wzn4.load({"id": ...})."""
        from entity.wzn4_entity import Wzn4Entity
        cached = getattr(self, "_wzn4", None)
        if cached is None:
            cached = Wzn4Entity(self, None)
            self._wzn4 = cached
        return cached

    def Wzn4(self, data=None):
        # Deprecated: use client.wzn4 instead.
        from entity.wzn4_entity import Wzn4Entity
        return Wzn4Entity(self, data)


    @property
    def wzn5(self):
        """Idiomatic facade: client.wzn5.list() / client.wzn5.load({"id": ...})."""
        from entity.wzn5_entity import Wzn5Entity
        cached = getattr(self, "_wzn5", None)
        if cached is None:
            cached = Wzn5Entity(self, None)
            self._wzn5 = cached
        return cached

    def Wzn5(self, data=None):
        # Deprecated: use client.wzn5 instead.
        from entity.wzn5_entity import Wzn5Entity
        return Wzn5Entity(self, data)


    @property
    def wzn6(self):
        """Idiomatic facade: client.wzn6.list() / client.wzn6.load({"id": ...})."""
        from entity.wzn6_entity import Wzn6Entity
        cached = getattr(self, "_wzn6", None)
        if cached is None:
            cached = Wzn6Entity(self, None)
            self._wzn6 = cached
        return cached

    def Wzn6(self, data=None):
        # Deprecated: use client.wzn6 instead.
        from entity.wzn6_entity import Wzn6Entity
        return Wzn6Entity(self, data)


    @property
    def z_map(self):
        """Idiomatic facade: client.z_map.list() / client.z_map.load({"id": ...})."""
        from entity.z_map_entity import ZMapEntity
        cached = getattr(self, "_z_map", None)
        if cached is None:
            cached = ZMapEntity(self, None)
            self._z_map = cached
        return cached

    def ZMap(self, data=None):
        # Deprecated: use client.z_map instead.
        from entity.z_map_entity import ZMapEntity
        return ZMapEntity(self, data)



    @classmethod
    def test(cls, testopts=None, sdkopts=None):
        if sdkopts is None:
            sdkopts = {}
        sdkopts = vs.clone(sdkopts)
        if not isinstance(sdkopts, dict):
            sdkopts = {}

        if testopts is None:
            testopts = {}
        testopts = vs.clone(testopts)
        if not isinstance(testopts, dict):
            testopts = {}
        testopts["active"] = True

        vs.setpath(sdkopts, "feature.test", testopts)

        sdk = cls(sdkopts)
        sdk.mode = "test"

        return sdk
