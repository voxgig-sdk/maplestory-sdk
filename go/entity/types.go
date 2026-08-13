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
}

// AndroidLoadMatch is the typed request payload for Android.LoadTyped.
type AndroidLoadMatch struct {
	Id *int `json:"id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Avatar is the typed data model for the avatar entity.
type Avatar struct {
}

// AvatarLoadMatch is the typed request payload for Avatar.LoadTyped.
type AvatarLoadMatch struct {
	Animation string `json:"animation"`
	CharacterId *string `json:"character_id,omitempty"`
	Frame int `json:"frame"`
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
}

// CharacterLoadMatch is the typed request payload for Character.LoadTyped.
type CharacterLoadMatch struct {
	Frame *string `json:"frame,omitempty"`
	Region string `json:"region"`
	SkinId *int `json:"skin_id,omitempty"`
	Version string `json:"version"`
}

// Chat is the typed data model for the chat entity.
type Chat struct {
}

// ChatLoadMatch is the typed request payload for Chat.LoadTyped.
type ChatLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
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
}

// GmsNewLoadMatch is the typed request payload for GmsNew.LoadTyped.
type GmsNewLoadMatch struct {
	Id *int `json:"id,omitempty"`
}

// GuildMark is the typed data model for the guild_mark entity.
type GuildMark struct {
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
}

// ItemLoadMatch is the typed request payload for Item.LoadTyped.
type ItemLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Id *int `json:"id,omitempty"`
	OverallCategory *string `json:"overall_category,omitempty"`
}

// Job is the typed data model for the job entity.
type Job struct {
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
}

// MapLoadMatch is the typed request payload for Map.LoadTyped.
type MapLoadMatch struct {
	Frame *int `json:"frame,omitempty"`
	Layer *int `json:"layer,omitempty"`
	MapId *int `json:"map_id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
	Id *int `json:"id,omitempty"`
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
}

// MobLoadMatch is the typed request payload for Mob.LoadTyped.
type MobLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Animation *string `json:"animation,omitempty"`
	Id *int `json:"id,omitempty"`
	MobId *int `json:"mob_id,omitempty"`
	Frame *int `json:"frame,omitempty"`
	SoundName *string `json:"sound_name,omitempty"`
}

// Music is the typed data model for the music entity.
type Music struct {
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
}

// Npc is the typed data model for the npc entity.
type Npc struct {
}

// NpcLoadMatch is the typed request payload for Npc.LoadTyped.
type NpcLoadMatch struct {
	Framebook *string `json:"framebook,omitempty"`
	Id *int `json:"id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
	NpcId *int `json:"npc_id,omitempty"`
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
}

// PetLoadMatch is the typed request payload for Pet.LoadTyped.
type PetLoadMatch struct {
	Animation *string `json:"animation,omitempty"`
	PetId *int `json:"pet_id,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
	Id *int `json:"id,omitempty"`
	RenderId *string `json:"render_id,omitempty"`
}

// Quest is the typed data model for the quest entity.
type Quest struct {
}

// QuestLoadMatch is the typed request payload for Quest.LoadTyped.
type QuestLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
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
}

// WznLoadMatch is the typed request payload for Wzn.LoadTyped.
type WznLoadMatch struct {
	Path *string `json:"path,omitempty"`
	Region string `json:"region"`
	Version string `json:"version"`
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
