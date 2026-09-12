import { MaplestoryEntityBase } from '../MaplestoryEntityBase';
import type { MaplestorySDK } from '../MaplestorySDK';
import type { Control } from '../types';
import type { PerformanceMetric, PerformanceMetricLoadMatch } from '../MaplestoryTypes';
declare class PerformanceMetricEntity extends MaplestoryEntityBase<PerformanceMetric> {
    constructor(client: MaplestorySDK, entopts: any);
    make(this: PerformanceMetricEntity): PerformanceMetricEntity;
    load(this: any, reqmatch?: PerformanceMetricLoadMatch, ctrl?: Control): Promise<PerformanceMetricEntity>;
}
export { PerformanceMetricEntity };
