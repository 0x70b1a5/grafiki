class BountiesList extends React.Component {
  render () {
    var bounties = this.props.bounties.map(function(bounty){
        return <Bounty bounty={bounty} key={bounty.id}/>
      });
    return (
      <div>
        {bounties}
      </div>
    );
  }
}
