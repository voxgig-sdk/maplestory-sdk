import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Cache, CacheLoadMatch } from '../MaplestoryTypes';
declare class CacheEntity extends MaplestoryEntityBase<Cache> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: CacheEntity): CacheEntity;
    load(this: any, reqmatch?: CacheLoadMatch, ctrl?: Control): Promise<CacheEntity>;
}
export { CacheEntity };
