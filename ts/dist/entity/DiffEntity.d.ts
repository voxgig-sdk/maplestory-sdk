import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Diff, DiffLoadMatch } from '../MaplestoryTypes';
declare class DiffEntity extends MaplestoryEntityBase<Diff> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: DiffEntity): DiffEntity;
    load(this: any, reqmatch?: DiffLoadMatch, ctrl?: Control): Promise<DiffEntity>;
}
export { DiffEntity };
