import math

import scipy.stats

def pearsonr(x, y):
  n = len(x)
  sum_x = sum(x)
  sum_y = sum(y)
  sum_x2 = sum(map(lambda a: a*a, x))
  sum_y2 = sum(map(lambda a: a*a, y))
  sum_xy = sum(map(lambda a,b: a*b, x, y))
  numerator = sum_xy - sum_x * sum_y / n
  denominator = math.sqrt((sum_x2 - sum_x * sum_x / n) * (sum_y2 - sum_y * sum_y / n))
  return numerator / denominator

if __name__ == "__main__":
  x = [2.0, 7.0]
  y = [2.0, 1.0]
  print pearsonr(x, y)
  print scipy.stats.pearsonr(x, y)
  x = [1.0, 2.0, 3.0]
  y = [1.0, 5.0, 7.0]
  print pearsonr(x, y)
  print scipy.stats.pearsonr(x, y)
  x = [1.0, 20.0, 3.0, 100.9]
  y = [1.0, 5.0, 70.0, 40.1]
  print pearsonr(x, y)
  print scipy.stats.pearsonr(x, y)
