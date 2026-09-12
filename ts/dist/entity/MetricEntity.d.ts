import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { Metric, MetricLoadMatch } from '../MaplestoryTypes';
declare class MetricEntity extends MaplestoryEntityBase<Metric> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: MetricEntity): MetricEntity;
    load(this: any, reqmatch?: MetricLoadMatch, ctrl?: Control): Promise<MetricEntity>;
}
export { MetricEntity };
