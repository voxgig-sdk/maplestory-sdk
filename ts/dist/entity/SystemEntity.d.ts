import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { System, SystemLoadMatch } from '../MaplestoryTypes';
declare class SystemEntity extends MaplestoryEntityBase<System> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: SystemEntity): SystemEntity;
    load(this: any, reqmatch?: SystemLoadMatch, ctrl?: Control): Promise<SystemEntity>;
}
export { SystemEntity };
