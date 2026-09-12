import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Entity1, Entity1LoadMatch } from '../MaplestoryTypes';
declare class Entity1Entity extends MaplestoryEntityBase<Entity1> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: Entity1Entity): Entity1Entity;
    load(this: any, reqmatch?: Entity1LoadMatch, ctrl?: Control): Promise<Entity1Entity>;
}
export { Entity1Entity };
