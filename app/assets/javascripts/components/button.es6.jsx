class Button extends React.Component {
  render () {
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
  theme: React.PropTypes.string,
  text: React.PropTypes.string,
  url: React.PropTypes.string
};
