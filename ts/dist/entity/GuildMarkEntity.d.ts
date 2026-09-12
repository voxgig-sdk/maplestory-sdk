import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { GuildMark, GuildMarkLoadMatch } from '../MaplestoryTypes';
declare class GuildMarkEntity extends MaplestoryEntityBase<GuildMark> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: GuildMarkEntity): GuildMarkEntity;
    load(this: any, reqmatch?: GuildMarkLoadMatch, ctrl?: Control): Promise<GuildMarkEntity>;
}
export { GuildMarkEntity };
