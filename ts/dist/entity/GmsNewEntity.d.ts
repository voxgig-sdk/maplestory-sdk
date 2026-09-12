import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { GmsNew, GmsNewLoadMatch } from '../MaplestoryTypes';
declare class GmsNewEntity extends MaplestoryEntityBase<GmsNew> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: GmsNewEntity): GmsNewEntity;
    load(this: any, reqmatch?: GmsNewLoadMatch, ctrl?: Control): Promise<GmsNewEntity>;
}
export { GmsNewEntity };
