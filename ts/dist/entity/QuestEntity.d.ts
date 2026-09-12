import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Quest, QuestLoadMatch } from '../MaplestoryTypes';
declare class QuestEntity extends MaplestoryEntityBase<Quest> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: QuestEntity): QuestEntity;
    load(this: any, reqmatch?: QuestLoadMatch, ctrl?: Control): Promise<QuestEntity>;
}
export { QuestEntity };
