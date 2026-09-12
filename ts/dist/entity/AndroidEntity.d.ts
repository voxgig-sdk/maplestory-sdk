import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Android, AndroidLoadMatch } from '../MaplestoryTypes';
declare class AndroidEntity extends MaplestoryEntityBase<Android> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: AndroidEntity): AndroidEntity;
    load(this: any, reqmatch?: AndroidLoadMatch, ctrl?: Control): Promise<AndroidEntity>;
}
export { AndroidEntity };
