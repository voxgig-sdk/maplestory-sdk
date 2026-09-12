import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Avatar, AvatarLoadMatch } from '../MaplestoryTypes';
declare class AvatarEntity extends MaplestoryEntityBase<Avatar> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: AvatarEntity): AvatarEntity;
    load(this: any, reqmatch?: AvatarLoadMatch, ctrl?: Control): Promise<AvatarEntity>;
}
export { AvatarEntity };
