import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Wzn, WznLoadMatch } from '../MaplestoryTypes';
declare class WznEntity extends MaplestoryEntityBase<Wzn> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: WznEntity): WznEntity;
    load(this: any, reqmatch?: WznLoadMatch, ctrl?: Control): Promise<WznEntity>;
}
export { WznEntity };
