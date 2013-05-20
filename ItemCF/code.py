import math

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
  print pearsonr([2.0, 7.0], [2.0, 1.0])
  print pearsonr([10.0, 3.0, 7.0], [190.0, 50.0, 23.0])
