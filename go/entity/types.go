// Typed models for the Maplestory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/maplestory-sdk/go/core"
)

// Android is the typed data model for the android entity.
type Android struct {
	Id *string `json:"id,omitempty"`
}

// AndroidLoadMatch is the typed request payload for Android.LoadTyped.
type AndroidLoadMatch struct {
	Id *int `json:"id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Avatar is the typed data model for the avatar entity.
type Avatar struct {
	Id *string `json:"id,omitempty"`
}

// AvatarLoadMatch is the typed request payload for Avatar.LoadTyped.
type AvatarLoadMatch struct {
	Animation string `json:"animation"`
	CharacterId *string `json:"character_id,omitempty"`
	Frame int `json:"frame"`
	BgColor *string `json:"bg_color,omitempty"`
	FlipX *bool `json:"flip_x,omitempty"`
	Name *string `json:"name,omitempty"`
	Padding *int `json:"padding,omitempty"`
	RenderMode *int `json:"render_mode,omitempty"`
	Resize *float64 `json:"resize,omitempty"`
	ShowEar *bool `json:"show_ear,omitempty"`
	ShowHighLefEar *bool `json:"show_high_lef_ear,omitempty"`
	ShowLefEar *bool `json:"show_lef_ear,omitempty"`
	Format *int `json:"format,omitempty"`
	Item *string `json:"item,omitempty"`
}

// Cache is the typed data model for the cache entity.
type Cache struct {
	EvictionCount *int `json:"evictionCount,omitempty"`
	HitCount *int `json:"hitCount,omitempty"`
	HitRatio *float64 `json:"hitRatio,omitempty"`
	MemoryUsage *int `json:"memoryUsage,omitempty"`
	MissCount *int `json:"missCount,omitempty"`
	TotalEntries *int `json:"totalEntries,omitempty"`
}

// CacheLoadMatch is the typed request payload for Cache.LoadTyped.
type CacheLoadMatch struct {
	EvictionCount *int `json:"evictionCount,omitempty"`
	HitCount *int `json:"hitCount,omitempty"`
	HitRatio *float64 `json:"hitRatio,omitempty"`
	MemoryUsage *int `json:"memoryUsage,omitempty"`
	MissCount *int `json:"missCount,omitempty"`
	TotalEntries *int `json:"totalEntries,omitempty"`
}

// Character is the typed data model for the character entity.
type Character struct {
	Id *string `json:"id,omitempty"`
}

// CharacterLoadMatch is the typed request payload for Character.LoadTyped.
type CharacterLoadMatch struct {
	Frame *string `json:"frame,omitempty"`
	Region string `json:"region"`
	SkinId *int `json:"skin_id,omitempty"`
	Version string `json:"version"`
	Animation *string `json:"animation,omitempty"`
	BgColor *string `json:"bg_color,omitempty"`
	FlipX *bool `json:"flip_x,omitempty"`
	Item *string `json:"item,omitempty"`
	Name *string `json:"name,omitempty"`
	Padding *int `json:"padding,omitempty"`
	RenderMode *int `json:"render_mode,omitempty"`
	Resize *float64 `json:"resize,omitempty"`
	ShowEar *bool `json:"show_ear,omitempty"`
	ShowHighLefEar *bool `json:"show_high_lef_ear,omitempty"`
	ShowLefEar *bool `json:"show_lef_ear,omitempty"`
	Format *int `json:"format,omitempty"`
}

// Chat is the typed data model for the chat entity.
type Chat struct {
}

// ChatLoadMatch is the typed request payload for Chat.LoadTyped.
type ChatLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Message *string `json:"message,omitempty"`
	RingIdsJoined *string `json:"ring_ids_joined,omitempty"`
}

// Cluster is the typed data model for the cluster entity.
type Cluster struct {
	Hostname *string `json:"hostname,omitempty"`
	LastSeen *string `json:"lastSeen,omitempty"`
	Metrics *map[string]any `json:"metrics,omitempty"`
}

// ClusterListMatch is the typed request payload for Cluster.ListTyped.
type ClusterListMatch struct {
	Hostname *string `json:"hostname,omitempty"`
	LastSeen *string `json:"lastSeen,omitempty"`
	Metrics *map[string]any `json:"metrics,omitempty"`
}

// Diff is the typed data model for the diff entity.
type Diff struct {
}

// DiffLoadMatch is the typed request payload for Diff.LoadTyped.
type DiffLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
}

// Entity1 is the typed data model for the entity1 entity.
type Entity1 struct {
}

// Entity1LoadMatch is the typed request payload for Entity1.LoadTyped.
type Entity1LoadMatch struct {
}

// GmsNew is the typed data model for the gms_new entity.
type GmsNew struct {
	Id *string `json:"id,omitempty"`
}

// GmsNewLoadMatch is the typed request payload for GmsNew.LoadTyped.
type GmsNewLoadMatch struct {
	Type *string `json:"type,omitempty"`
}

// GuildMark is the typed data model for the guild_mark entity.
type GuildMark struct {
	Id *string `json:"id,omitempty"`
}

// GuildMarkLoadMatch is the typed request payload for GuildMark.LoadTyped.
type GuildMarkLoadMatch struct {
	GuildBackgroundColorId *int `json:"guild_background_color_id,omitempty"`
	GuildBackgroundId *int `json:"guild_background_id,omitempty"`
	GuildMarkColorId *int `json:"guild_mark_color_id,omitempty"`
	GuildMarkId int `json:"guild_mark_id"`
	Region string `json:"region"`
	Version string `json:"version"`
	ColorId *int `json:"color_id,omitempty"`
}

// Health is the typed data model for the health entity.
type Health struct {
}

// HealthLoadMatch is the typed request payload for Health.LoadTyped.
type HealthLoadMatch struct {
}

// Item is the typed data model for the item entity.
type Item struct {
	Id *string `json:"id,omitempty"`
}

// ItemLoadMatch is the typed request payload for Item.LoadTyped.
type ItemLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	CashFilter *bool `json:"cash_filter,omitempty"`
	CategoryFilter *string `json:"category_filter,omitempty"`
	Count *int `json:"count,omitempty"`
	GenderFilter *int `json:"gender_filter,omitempty"`
	JobFilter *int `json:"job_filter,omitempty"`
	MaxLevelFilter *int `json:"max_level_filter,omitempty"`
	MinLevelFilter *int `json:"min_level_filter,omitempty"`
	OverallCategoryFilter *string `json:"overall_category_filter,omitempty"`
	SearchFor *string `json:"search_for,omitempty"`
	StartPosition *int `json:"start_position,omitempty"`
	SubCategoryFilter *string `json:"sub_category_filter,omitempty"`
	Id *int `json:"id,omitempty"`
	OverallCategory *string `json:"overall_category,omitempty"`
}

// Job is the typed data model for the job entity.
type Job struct {
	Id *string `json:"id,omitempty"`
}

// JobLoadMatch is the typed request payload for Job.LoadTyped.
type JobLoadMatch struct {
	Id *int `json:"id,omitempty"`
	Region string `json:"region"`
	SkillId *int `json:"skill_id,omitempty"`
	Version string `json:"version"`
}

// Map is the typed data model for the map entity.
type Map struct {
	Id *string `json:"id,omitempty"`
}

// MapLoadMatch is the typed request payload for Map.LoadTyped.
type MapLoadMatch struct {
	Frame *int `json:"frame,omitempty"`
	Layer *int `json:"layer,omitempty"`
	MapId *int `json:"map_id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
	FilterTrash *bool `json:"filter_trash,omitempty"`
	MinX *int `json:"min_x,omitempty"`
	MinY *int `json:"min_y,omitempty"`
	Id *int `json:"id,omitempty"`
	ShowLife *bool `json:"show_life,omitempty"`
	ShowPortal *bool `json:"show_portal,omitempty"`
	Count *int `json:"count,omitempty"`
	SearchFor *string `json:"search_for,omitempty"`
	StartPosition *int `json:"start_position,omitempty"`
	Map *string `json:"map,omitempty"`
	MarkName *string `json:"mark_name,omitempty"`
}

// Metric is the typed data model for the metric entity.
type Metric struct {
}

// MetricLoadMatch is the typed request payload for Metric.LoadTyped.
type MetricLoadMatch struct {
}

// Mob is the typed data model for the mob entity.
type Mob struct {
	Id *string `json:"id,omitempty"`
}

// MobLoadMatch is the typed request payload for Mob.LoadTyped.
type MobLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Count *int `json:"count,omitempty"`
	MaxLevelFilter *int `json:"max_level_filter,omitempty"`
	MinLevelFilter *int `json:"min_level_filter,omitempty"`
	SearchFor *string `json:"search_for,omitempty"`
	StartPosition *int `json:"start_position,omitempty"`
	Animation *string `json:"animation,omitempty"`
	Id *int `json:"id,omitempty"`
	BgColor *string `json:"bg_color,omitempty"`
	MobId *int `json:"mob_id,omitempty"`
	Frame *int `json:"frame,omitempty"`
	SoundName *string `json:"sound_name,omitempty"`
}

// Music is the typed data model for the music entity.
type Music struct {
	Id *string `json:"id,omitempty"`
}

// MusicLoadMatch is the typed request payload for Music.LoadTyped.
type MusicLoadMatch struct {
	Id string `json:"id"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Name is the typed data model for the name entity.
type Name struct {
}

// NameLoadMatch is the typed request payload for Name.LoadTyped.
type NameLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Name *string `json:"name,omitempty"`
	RingIdsJoined *string `json:"ring_ids_joined,omitempty"`
}

// Npc is the typed data model for the npc entity.
type Npc struct {
	Id *string `json:"id,omitempty"`
}

// NpcLoadMatch is the typed request payload for Npc.LoadTyped.
type NpcLoadMatch struct {
	Framebook *string `json:"framebook,omitempty"`
	Id *int `json:"id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
	Animation *string `json:"animation,omitempty"`
	BgColor *string `json:"bg_color,omitempty"`
	NpcId *int `json:"npc_id,omitempty"`
	Frame *int `json:"frame,omitempty"`
	Count *int `json:"count,omitempty"`
	SearchFor *string `json:"search_for,omitempty"`
	StartAt *int `json:"start_at,omitempty"`
}

// Nxf is the typed data model for the nxf entity.
type Nxf struct {
}

// NxfLoadMatch is the typed request payload for Nxf.LoadTyped.
type NxfLoadMatch struct {
}

// PerformanceMetric is the typed data model for the performance_metric entity.
type PerformanceMetric struct {
	ActiveRequests *int `json:"activeRequests,omitempty"`
	AverageResponseTimeMs *float64 `json:"averageResponseTimeMs,omitempty"`
	Cache *map[string]any `json:"cache,omitempty"`
	ErrorsByType *map[string]any `json:"errorsByType,omitempty"`
	LastUpdated *string `json:"lastUpdated,omitempty"`
	MemoryUsedBytes *int `json:"memoryUsedBytes,omitempty"`
	RedisCache *map[string]any `json:"redisCache,omitempty"`
	RequestsPerSecond *float64 `json:"requestsPerSecond,omitempty"`
	StartTime *string `json:"startTime,omitempty"`
	System *map[string]any `json:"system,omitempty"`
	TotalErrors *int `json:"totalErrors,omitempty"`
	TotalRequests *int `json:"totalRequests,omitempty"`
	WzPropertiesLoaded *int `json:"wzPropertiesLoaded,omitempty"`
}

// PerformanceMetricLoadMatch is the typed request payload for PerformanceMetric.LoadTyped.
type PerformanceMetricLoadMatch struct {
	ActiveRequests *int `json:"activeRequests,omitempty"`
	AverageResponseTimeMs *float64 `json:"averageResponseTimeMs,omitempty"`
	Cache *map[string]any `json:"cache,omitempty"`
	ErrorsByType *map[string]any `json:"errorsByType,omitempty"`
	LastUpdated *string `json:"lastUpdated,omitempty"`
	MemoryUsedBytes *int `json:"memoryUsedBytes,omitempty"`
	RedisCache *map[string]any `json:"redisCache,omitempty"`
	RequestsPerSecond *float64 `json:"requestsPerSecond,omitempty"`
	StartTime *string `json:"startTime,omitempty"`
	System *map[string]any `json:"system,omitempty"`
	TotalErrors *int `json:"totalErrors,omitempty"`
	TotalRequests *int `json:"totalRequests,omitempty"`
	WzPropertiesLoaded *int `json:"wzPropertiesLoaded,omitempty"`
}

// Pet is the typed data model for the pet entity.
type Pet struct {
	Id *string `json:"id,omitempty"`
}

// PetLoadMatch is the typed request payload for Pet.LoadTyped.
type PetLoadMatch struct {
	Animation *string `json:"animation,omitempty"`
	PetId *int `json:"pet_id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
	Frame *int `json:"frame,omitempty"`
	PetEquip *int `json:"pet_equip,omitempty"`
	Id *int `json:"id,omitempty"`
	RenderId *string `json:"render_id,omitempty"`
	BgColor *string `json:"bg_color,omitempty"`
}

// Quest is the typed data model for the quest entity.
type Quest struct {
	Id *string `json:"id,omitempty"`
}

// QuestLoadMatch is the typed request payload for Quest.LoadTyped.
type QuestLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Count *int `json:"count,omitempty"`
	SearchFor *string `json:"search_for,omitempty"`
	StartPosition *int `json:"start_position,omitempty"`
	Category *int `json:"category,omitempty"`
	Id *int `json:"id,omitempty"`
}

// System is the typed data model for the system entity.
type System struct {
	CpuUsagePercent *float64 `json:"cpuUsagePercent,omitempty"`
	GcGen0Collections *int `json:"gcGen0Collections,omitempty"`
	GcGen1Collections *int `json:"gcGen1Collections,omitempty"`
	GcGen2Collections *int `json:"gcGen2Collections,omitempty"`
	ThreadCount *int `json:"threadCount,omitempty"`
	TotalMemoryBytes *int `json:"totalMemoryBytes,omitempty"`
	UsedMemoryBytes *int `json:"usedMemoryBytes,omitempty"`
}

// SystemLoadMatch is the typed request payload for System.LoadTyped.
type SystemLoadMatch struct {
	CpuUsagePercent *float64 `json:"cpuUsagePercent,omitempty"`
	GcGen0Collections *int `json:"gcGen0Collections,omitempty"`
	GcGen1Collections *int `json:"gcGen1Collections,omitempty"`
	GcGen2Collections *int `json:"gcGen2Collections,omitempty"`
	ThreadCount *int `json:"threadCount,omitempty"`
	TotalMemoryBytes *int `json:"totalMemoryBytes,omitempty"`
	UsedMemoryBytes *int `json:"usedMemoryBytes,omitempty"`
}

// Tip is the typed data model for the tip entity.
type Tip struct {
}

// TipLoadMatch is the typed request payload for Tip.LoadTyped.
type TipLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
}

// Wzn is the typed data model for the wzn entity.
type Wzn struct {
	Id *string `json:"id,omitempty"`
}

// WznLoadMatch is the typed request payload for Wzn.LoadTyped.
type WznLoadMatch struct {
	Path string `json:"path"`
	Region *string `json:"region,omitempty"`
	Version *string `json:"version,omitempty"`
}

// ZMap is the typed data model for the z_map entity.
type ZMap struct {
}

// ZMapLoadMatch is the typed request payload for ZMap.LoadTyped.
type ZMapLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
