class Button extends React.Component {
  render () {
    return (
      <div className={this.props.theme+" button"}>
        <a href={this.props.url}>{this.props.text}</a>
      </div>
    );
  }
}

Button.propTypes = {
  theme: React.PropTypes.string,
  text: React.PropTypes.string,
  url: React.PropTypes.string
};
