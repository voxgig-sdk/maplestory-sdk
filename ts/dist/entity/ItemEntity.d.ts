import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Item, ItemLoadMatch } from '../MaplestoryTypes';
declare class ItemEntity extends MaplestoryEntityBase<Item> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: ItemEntity): ItemEntity;
    load(this: any, reqmatch?: ItemLoadMatch, ctrl?: Control): Promise<ItemEntity>;
}
export { ItemEntity };
