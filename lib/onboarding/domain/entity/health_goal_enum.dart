enum HealthGoal {
  helpReduceStress('I want help in reducing my stress'),
  helpControlSuicidalThoughts('I want to get rid of suicidal thoughts'),
  helpEmotionalInstability('I want help with emotional instability'),
  helpCopeWithTrauma('I need help in coping with my past trauma'),
  needSomeoneToTalk('I need someone to talk with'),
  exploring('I am just exploring AI Therapy');

  final String text;
  const HealthGoal(this.text);
}
