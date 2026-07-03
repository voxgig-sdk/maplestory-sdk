package voxgigmaplestorysdk

import (
	"github.com/voxgig-sdk/maplestory-sdk/go/core"
	"github.com/voxgig-sdk/maplestory-sdk/go/entity"
	"github.com/voxgig-sdk/maplestory-sdk/go/feature"
	_ "github.com/voxgig-sdk/maplestory-sdk/go/utility"
)

// Type aliases preserve external API.
type MaplestorySDK = core.MaplestorySDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type MaplestoryEntity = core.MaplestoryEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type MaplestoryError = core.MaplestoryError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewAndroidEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewAndroidEntity(client, entopts)
	}
	core.NewAvatarEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewAvatarEntity(client, entopts)
	}
	core.NewCacheEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewCacheEntity(client, entopts)
	}
	core.NewCharacterEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewCharacterEntity(client, entopts)
	}
	core.NewChatEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewChatEntity(client, entopts)
	}
	core.NewClusterEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewClusterEntity(client, entopts)
	}
	core.NewDiffEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewDiffEntity(client, entopts)
	}
	core.NewEntity1EntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewEntity1Entity(client, entopts)
	}
	core.NewGmsNewEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewGmsNewEntity(client, entopts)
	}
	core.NewGuildMarkEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewGuildMarkEntity(client, entopts)
	}
	core.NewHealthEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewHealthEntity(client, entopts)
	}
	core.NewItemEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewItemEntity(client, entopts)
	}
	core.NewJobEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewJobEntity(client, entopts)
	}
	core.NewMapEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewMapEntity(client, entopts)
	}
	core.NewMetricEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewMetricEntity(client, entopts)
	}
	core.NewMobEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewMobEntity(client, entopts)
	}
	core.NewMusicEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewMusicEntity(client, entopts)
	}
	core.NewNameEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewNameEntity(client, entopts)
	}
	core.NewNpcEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewNpcEntity(client, entopts)
	}
	core.NewNxfEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewNxfEntity(client, entopts)
	}
	core.NewPerformanceMetricEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewPerformanceMetricEntity(client, entopts)
	}
	core.NewPetEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewPetEntity(client, entopts)
	}
	core.NewQuestEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewQuestEntity(client, entopts)
	}
	core.NewSystemEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewSystemEntity(client, entopts)
	}
	core.NewTipEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewTipEntity(client, entopts)
	}
	core.NewWznEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewWznEntity(client, entopts)
	}
	core.NewWzn2EntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewWzn2Entity(client, entopts)
	}
	core.NewWzn3EntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewWzn3Entity(client, entopts)
	}
	core.NewWzn4EntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewWzn4Entity(client, entopts)
	}
	core.NewWzn5EntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewWzn5Entity(client, entopts)
	}
	core.NewWzn6EntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewWzn6Entity(client, entopts)
	}
	core.NewZMapEntityFunc = func(client *core.MaplestorySDK, entopts map[string]any) core.MaplestoryEntity {
		return entity.NewZMapEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewMaplestorySDK = core.NewMaplestorySDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewMaplestorySDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *MaplestorySDK  { return NewMaplestorySDK(nil) }
func Test() *MaplestorySDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
