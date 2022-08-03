
NUMERICAL_FEATURES = ['Temp', 'HR', 'Resp', 'WBC']

# Keys
LABEL_KEY = 'isSeptic'

def t_name(key):
  """
  Rename the feature keys so that they don't clash with the raw keys when
  running the Evaluator component.
  Args:
    key: The original feature key
  Returns:
    key with '_xf' appended
  """
  return key + '_xf'
