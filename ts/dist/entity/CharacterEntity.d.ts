import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Character, CharacterLoadMatch } from '../MaplestoryTypes';
declare class CharacterEntity extends MaplestoryEntityBase<Character> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: CharacterEntity): CharacterEntity;
    load(this: any, reqmatch?: CharacterLoadMatch, ctrl?: Control): Promise<CharacterEntity>;
}
export { CharacterEntity };
