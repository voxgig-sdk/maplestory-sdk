import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Npc, NpcLoadMatch } from '../MaplestoryTypes';
declare class NpcEntity extends MaplestoryEntityBase<Npc> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: NpcEntity): NpcEntity;
    load(this: any, reqmatch?: NpcLoadMatch, ctrl?: Control): Promise<NpcEntity>;
}
export { NpcEntity };
