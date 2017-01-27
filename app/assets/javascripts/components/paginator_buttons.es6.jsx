class PaginatorButtons extends React.Component {
  render () {
    return (
      <div className={"paginator"}>
        <Button
          condition={String(this.props.paginator>=this.props.limit)}
          text={"< previous "+this.props.limit+" "+this.props.items}
          url={this.props.route+"/?start="+(this.props.paginator-this.props.limit)}
          theme={this.props.theme} />
        <Button
          text={"next "+this.props.limit+" "+this.props.items+" >"}
          url={this.props.route+"/?start="+(this.props.paginator+this.props.limit)}
          theme={this.props.theme} />
      </div>
    )
  }
}
