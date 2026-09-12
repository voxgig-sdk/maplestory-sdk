import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Cluster, ClusterListMatch } from '../MaplestoryTypes';
declare class ClusterEntity extends MaplestoryEntityBase<Cluster> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: ClusterEntity): ClusterEntity;
    list(this: any, reqmatch?: ClusterListMatch, ctrl?: Control): Promise<ClusterEntity[]>;
}
export { ClusterEntity };
