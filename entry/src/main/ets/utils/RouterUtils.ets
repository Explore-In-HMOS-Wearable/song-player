import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

export function routePageWithObjectParams(url: string, params: object) {
  let options:router.RouterOptions = {
    url: url,
    params: params
  }
  try {
    router.pushUrl(options, router.RouterMode.Single)
  } catch (err) {
    console.info(` fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
  }
}

export function getParams() {
  let params: object | string = router.getParams()
  try {
    return params
  } catch (err) {
    console.info(` fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
    return undefined
  }
}
