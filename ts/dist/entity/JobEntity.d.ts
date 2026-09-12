import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Job, JobLoadMatch } from '../MaplestoryTypes';
declare class JobEntity extends MaplestoryEntityBase<Job> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: JobEntity): JobEntity;
    load(this: any, reqmatch?: JobLoadMatch, ctrl?: Control): Promise<JobEntity>;
}
export { JobEntity };
