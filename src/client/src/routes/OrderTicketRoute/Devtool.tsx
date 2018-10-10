import _ from 'lodash'
import * as React from 'react'

export interface DevtoolProps {
  enabled: boolean
  children: (props: any) => any
}

export default class Devtool extends React.Component<DevtoolProps, any> {
  state = {
    visible: document.hasFocus(),
  }

  listener = _.throttle((e: any) => {
    const visible = document.hasFocus()

    if (this.state.visible !== visible) {
      this.setState({ visible })
    }
  }, 50)

  interval: any

  componentDidMount() {
    if (this.props.enabled) {
      this.interval = setInterval(this.listener, 60)
      document.addEventListener('visibilitychange', this.listener)
      document.addEventListener('focus', this.listener)
    }
  }

  componentWillUnmount() {
    clearInterval(this.interval)
    document.removeEventListener('visibilitychange', this.listener)
    document.removeEventListener('focus', this.listener)
  }
  render() {
    return this.props.children(this.state)
  }
}
