import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Tip, TipLoadMatch } from '../MaplestoryTypes';
declare class TipEntity extends MaplestoryEntityBase<Tip> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: TipEntity): TipEntity;
    load(this: any, reqmatch?: TipLoadMatch, ctrl?: Control): Promise<TipEntity>;
}
export { TipEntity };
