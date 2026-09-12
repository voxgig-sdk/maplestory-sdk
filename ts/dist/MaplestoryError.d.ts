import { Context } from './Context';
declare class MaplestoryError extends Error {
    isMaplestoryError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { MaplestoryError };
