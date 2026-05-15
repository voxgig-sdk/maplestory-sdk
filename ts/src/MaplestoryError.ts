
import { Context } from './Context'


class MaplestoryError extends Error {

  isMaplestoryError = true

  sdk = 'Maplestory'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  MaplestoryError
}

