class BountiesList extends React.Component {
  render () {
    var bounties = this.props.bounties.map(function(bounty){
        return <Bounty bounty={bounty}/>
      });
    return (
      <div>
        {bounties}
      </div>
    );
  }
}
