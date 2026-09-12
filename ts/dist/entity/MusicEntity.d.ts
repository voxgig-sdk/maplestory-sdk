import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Music, MusicLoadMatch } from '../MaplestoryTypes';
declare class MusicEntity extends MaplestoryEntityBase<Music> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: MusicEntity): MusicEntity;
    load(this: any, reqmatch?: MusicLoadMatch, ctrl?: Control): Promise<MusicEntity>;
}
export { MusicEntity };
