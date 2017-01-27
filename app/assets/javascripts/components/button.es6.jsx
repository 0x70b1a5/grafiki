class Button extends React.Component {
  render () {
    if (this.props.condition && this.props.condition === "false") {
      return null;
    }
    return (
      <a href={this.props.url}>
        <div className={this.props.theme+" button"}>
          {this.props.text}
          {this.props.children}
        </div>
      </a>
    );
  }
}

Button.propTypes = {
  condition: React.PropTypes.string,
  theme: React.PropTypes.string,
  text: React.PropTypes.string,
  url: React.PropTypes.string
};
