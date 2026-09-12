import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Chat, ChatLoadMatch } from '../MaplestoryTypes';
declare class ChatEntity extends MaplestoryEntityBase<Chat> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: ChatEntity): ChatEntity;
    load(this: any, reqmatch?: ChatLoadMatch, ctrl?: Control): Promise<ChatEntity>;
}
export { ChatEntity };
