import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Nxf, NxfLoadMatch } from '../MaplestoryTypes';
declare class NxfEntity extends MaplestoryEntityBase<Nxf> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: NxfEntity): NxfEntity;
    load(this: any, reqmatch?: NxfLoadMatch, ctrl?: Control): Promise<NxfEntity>;
}
export { NxfEntity };
