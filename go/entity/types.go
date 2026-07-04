// Typed models for the Maplestory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Android is the typed data model for the android entity.
type Android struct {
}

// AndroidLoadMatch is the typed request payload for Android.LoadTyped.
type AndroidLoadMatch struct {
	Id int `json:"id"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Avatar is the typed data model for the avatar entity.
type Avatar struct {
}

// AvatarLoadMatch is the typed request payload for Avatar.LoadTyped.
type AvatarLoadMatch struct {
	Animation string `json:"animation"`
	CharacterId string `json:"character_id"`
	Frame int `json:"frame"`
	Item string `json:"item"`
}

// Cache is the typed data model for the cache entity.
type Cache struct {
	EvictionCount *int `json:"eviction_count,omitempty"`
	HitCount *int `json:"hit_count,omitempty"`
	HitRatio *float64 `json:"hit_ratio,omitempty"`
	MemoryUsage *int `json:"memory_usage,omitempty"`
	MissCount *int `json:"miss_count,omitempty"`
	TotalEntry *int `json:"total_entry,omitempty"`
}

// CacheLoadMatch mirrors the cache fields as an all-optional match
// filter (Go analog of Partial<Cache>).
type CacheLoadMatch struct {
	EvictionCount *int `json:"eviction_count,omitempty"`
	HitCount *int `json:"hit_count,omitempty"`
	HitRatio *float64 `json:"hit_ratio,omitempty"`
	MemoryUsage *int `json:"memory_usage,omitempty"`
	MissCount *int `json:"miss_count,omitempty"`
	TotalEntry *int `json:"total_entry,omitempty"`
}

// Character is the typed data model for the character entity.
type Character struct {
}

// CharacterLoadMatch is the typed request payload for Character.LoadTyped.
type CharacterLoadMatch struct {
	Frame string `json:"frame"`
	Region string `json:"region"`
	SkinId int `json:"skin_id"`
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
	LastSeen *string `json:"last_seen,omitempty"`
	Metric *map[string]any `json:"metric,omitempty"`
}

// ClusterListMatch mirrors the cluster fields as an all-optional match
// filter (Go analog of Partial<Cluster>).
type ClusterListMatch struct {
	Hostname *string `json:"hostname,omitempty"`
	LastSeen *string `json:"last_seen,omitempty"`
	Metric *map[string]any `json:"metric,omitempty"`
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

// Entity1LoadMatch mirrors the entity1 fields as an all-optional match
// filter (Go analog of Partial<Entity1>).
type Entity1LoadMatch struct {
}

// GmsNew is the typed data model for the gms_new entity.
type GmsNew struct {
}

// GmsNewLoadMatch is the typed request payload for GmsNew.LoadTyped.
type GmsNewLoadMatch struct {
	Id int `json:"id"`
}

// GuildMark is the typed data model for the guild_mark entity.
type GuildMark struct {
}

// GuildMarkLoadMatch is the typed request payload for GuildMark.LoadTyped.
type GuildMarkLoadMatch struct {
	GuildBackgroundColorId int `json:"guild_background_color_id"`
	GuildBackgroundId int `json:"guild_background_id"`
	GuildMarkColorId int `json:"guild_mark_color_id"`
	GuildMarkId int `json:"guild_mark_id"`
	Region string `json:"region"`
	Version string `json:"version"`
	ColorId int `json:"color_id"`
}

// Health is the typed data model for the health entity.
type Health struct {
}

// HealthLoadMatch mirrors the health fields as an all-optional match
// filter (Go analog of Partial<Health>).
type HealthLoadMatch struct {
}

// Item is the typed data model for the item entity.
type Item struct {
}

// ItemLoadMatch is the typed request payload for Item.LoadTyped.
type ItemLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Id int `json:"id"`
	OverallCategory string `json:"overall_category"`
}

// Job is the typed data model for the job entity.
type Job struct {
}

// JobLoadMatch is the typed request payload for Job.LoadTyped.
type JobLoadMatch struct {
	Id int `json:"id"`
	Region string `json:"region"`
	SkillId int `json:"skill_id"`
	Version string `json:"version"`
}

// Map is the typed data model for the map entity.
type Map struct {
}

// MapLoadMatch is the typed request payload for Map.LoadTyped.
type MapLoadMatch struct {
	Frame int `json:"frame"`
	Layer int `json:"layer"`
	MapId int `json:"map_id"`
	Region string `json:"region"`
	Version string `json:"version"`
	Id int `json:"id"`
	Map string `json:"map"`
	MarkName string `json:"mark_name"`
}

// Metric is the typed data model for the metric entity.
type Metric struct {
}

// MetricLoadMatch mirrors the metric fields as an all-optional match
// filter (Go analog of Partial<Metric>).
type MetricLoadMatch struct {
}

// Mob is the typed data model for the mob entity.
type Mob struct {
}

// MobLoadMatch is the typed request payload for Mob.LoadTyped.
type MobLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Animation string `json:"animation"`
	Id int `json:"id"`
	MobId int `json:"mob_id"`
	Frame int `json:"frame"`
	SoundName string `json:"sound_name"`
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
	Framebook string `json:"framebook"`
	Id int `json:"id"`
	Region string `json:"region"`
	Version string `json:"version"`
	NpcId int `json:"npc_id"`
}

// Nxf is the typed data model for the nxf entity.
type Nxf struct {
}

// NxfLoadMatch mirrors the nxf fields as an all-optional match
// filter (Go analog of Partial<Nxf>).
type NxfLoadMatch struct {
}

// PerformanceMetric is the typed data model for the performance_metric entity.
type PerformanceMetric struct {
	ActiveRequest *int `json:"active_request,omitempty"`
	AverageResponseTimeM *float64 `json:"average_response_time_m,omitempty"`
	Cache *map[string]any `json:"cache,omitempty"`
	ErrorsByType *map[string]any `json:"errors_by_type,omitempty"`
	LastUpdated *string `json:"last_updated,omitempty"`
	MemoryUsedByte *int `json:"memory_used_byte,omitempty"`
	RedisCache *map[string]any `json:"redis_cache,omitempty"`
	RequestsPerSecond *float64 `json:"requests_per_second,omitempty"`
	StartTime *string `json:"start_time,omitempty"`
	System *map[string]any `json:"system,omitempty"`
	TotalError *int `json:"total_error,omitempty"`
	TotalRequest *int `json:"total_request,omitempty"`
	WzPropertiesLoaded *int `json:"wz_properties_loaded,omitempty"`
}

// PerformanceMetricLoadMatch mirrors the performance_metric fields as an all-optional match
// filter (Go analog of Partial<PerformanceMetric>).
type PerformanceMetricLoadMatch struct {
	ActiveRequest *int `json:"active_request,omitempty"`
	AverageResponseTimeM *float64 `json:"average_response_time_m,omitempty"`
	Cache *map[string]any `json:"cache,omitempty"`
	ErrorsByType *map[string]any `json:"errors_by_type,omitempty"`
	LastUpdated *string `json:"last_updated,omitempty"`
	MemoryUsedByte *int `json:"memory_used_byte,omitempty"`
	RedisCache *map[string]any `json:"redis_cache,omitempty"`
	RequestsPerSecond *float64 `json:"requests_per_second,omitempty"`
	StartTime *string `json:"start_time,omitempty"`
	System *map[string]any `json:"system,omitempty"`
	TotalError *int `json:"total_error,omitempty"`
	TotalRequest *int `json:"total_request,omitempty"`
	WzPropertiesLoaded *int `json:"wz_properties_loaded,omitempty"`
}

// Pet is the typed data model for the pet entity.
type Pet struct {
}

// PetLoadMatch is the typed request payload for Pet.LoadTyped.
type PetLoadMatch struct {
	Animation string `json:"animation"`
	PetId int `json:"pet_id"`
	Region string `json:"region"`
	Version string `json:"version"`
	Id int `json:"id"`
	RenderId string `json:"render_id"`
}

// Quest is the typed data model for the quest entity.
type Quest struct {
}

// QuestLoadMatch is the typed request payload for Quest.LoadTyped.
type QuestLoadMatch struct {
	Region string `json:"region"`
	Version string `json:"version"`
	Category int `json:"category"`
	Id int `json:"id"`
}

// System is the typed data model for the system entity.
type System struct {
	CpuUsagePercent *float64 `json:"cpu_usage_percent,omitempty"`
	GcGen0Collection *int `json:"gc_gen0_collection,omitempty"`
	GcGen1Collection *int `json:"gc_gen1_collection,omitempty"`
	GcGen2Collection *int `json:"gc_gen2_collection,omitempty"`
	ThreadCount *int `json:"thread_count,omitempty"`
	TotalMemoryByte *int `json:"total_memory_byte,omitempty"`
	UsedMemoryByte *int `json:"used_memory_byte,omitempty"`
}

// SystemLoadMatch mirrors the system fields as an all-optional match
// filter (Go analog of Partial<System>).
type SystemLoadMatch struct {
	CpuUsagePercent *float64 `json:"cpu_usage_percent,omitempty"`
	GcGen0Collection *int `json:"gc_gen0_collection,omitempty"`
	GcGen1Collection *int `json:"gc_gen1_collection,omitempty"`
	GcGen2Collection *int `json:"gc_gen2_collection,omitempty"`
	ThreadCount *int `json:"thread_count,omitempty"`
	TotalMemoryByte *int `json:"total_memory_byte,omitempty"`
	UsedMemoryByte *int `json:"used_memory_byte,omitempty"`
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
	Region string `json:"region"`
	Version string `json:"version"`
}

// Wzn2 is the typed data model for the wzn2 entity.
type Wzn2 struct {
}

// Wzn2LoadMatch is the typed request payload for Wzn2.LoadTyped.
type Wzn2LoadMatch struct {
	Path string `json:"path"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Wzn3 is the typed data model for the wzn3 entity.
type Wzn3 struct {
}

// Wzn3LoadMatch is the typed request payload for Wzn3.LoadTyped.
type Wzn3LoadMatch struct {
	Path string `json:"path"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Wzn4 is the typed data model for the wzn4 entity.
type Wzn4 struct {
}

// Wzn4LoadMatch is the typed request payload for Wzn4.LoadTyped.
type Wzn4LoadMatch struct {
	Path string `json:"path"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Wzn5 is the typed data model for the wzn5 entity.
type Wzn5 struct {
}

// Wzn5LoadMatch is the typed request payload for Wzn5.LoadTyped.
type Wzn5LoadMatch struct {
	Path string `json:"path"`
	Region string `json:"region"`
	Version string `json:"version"`
}

// Wzn6 is the typed data model for the wzn6 entity.
type Wzn6 struct {
}

// Wzn6LoadMatch is the typed request payload for Wzn6.LoadTyped.
type Wzn6LoadMatch struct {
	Path string `json:"path"`
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

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
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

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
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
