SUCCESS_GREEN='\033[0;32m'
ERROR_RED='\033[0;31m'
NC='\033[0m'

success_message="${SUCCESS_GREEN}成功${NC}"
error_message="${ERROR_RED}エラー${NC}"

total_count=7
passed_count=0

# 正しくパスすること
test_case=$(./gcd.sh 2 4)
expectation=2
if [[ $test_case -eq $expectation ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

test_case=$(./gcd.sh 30 12)
expectation=6
if [[ $test_case -eq $expectation ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

# 引数の数エラーが返ること
./gcd.sh 3 | grep "引数は2つ指定してください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

./gcd.sh 38 5 10 | grep "引数は2つ指定してください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

# 自然数エラーが返ること
./gcd.sh -67 2 | grep "引数は自然数としてください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

./gcd.sh 112.5 84 | grep "引数は自然数としてください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

./gcd.sh 阿 🐍 | grep "引数は自然数としてください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $error_message
  exit 1
fi

echo $passed_count/$total_count 個のテストが成功しました

