import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Pet, PetLoadMatch } from '../MaplestoryTypes';
declare class PetEntity extends MaplestoryEntityBase<Pet> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: PetEntity): PetEntity;
    load(this: any, reqmatch?: PetLoadMatch, ctrl?: Control): Promise<PetEntity>;
}
export { PetEntity };
