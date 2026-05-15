
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { MaplestorySDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await MaplestorySDK.test()
    equal(null !== testsdk, true)
  })

})
