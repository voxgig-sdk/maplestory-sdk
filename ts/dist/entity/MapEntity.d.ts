import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { MapType, MapLoadMatch } from '../MaplestoryTypes';
declare class MapEntity extends MaplestoryEntityBase<MapType> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: MapEntity): MapEntity;
    load(this: any, reqmatch?: MapLoadMatch, ctrl?: Control): Promise<MapEntity>;
}
export { MapEntity };
