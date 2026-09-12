import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Name, NameLoadMatch } from '../MaplestoryTypes';
declare class NameEntity extends MaplestoryEntityBase<Name> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: NameEntity): NameEntity;
    load(this: any, reqmatch?: NameLoadMatch, ctrl?: Control): Promise<NameEntity>;
}
export { NameEntity };
