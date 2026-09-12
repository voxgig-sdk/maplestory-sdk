import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { ZMap, ZMapLoadMatch } from '../MaplestoryTypes';
declare class ZMapEntity extends MaplestoryEntityBase<ZMap> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: ZMapEntity): ZMapEntity;
    load(this: any, reqmatch?: ZMapLoadMatch, ctrl?: Control): Promise<ZMapEntity>;
}
export { ZMapEntity };
