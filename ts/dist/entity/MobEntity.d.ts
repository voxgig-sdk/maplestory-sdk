import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Mob, MobLoadMatch } from '../MaplestoryTypes';
declare class MobEntity extends MaplestoryEntityBase<Mob> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: MobEntity): MobEntity;
    load(this: any, reqmatch?: MobLoadMatch, ctrl?: Control): Promise<MobEntity>;
}
export { MobEntity };
