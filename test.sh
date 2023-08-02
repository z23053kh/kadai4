SUCCESS_GREEN='\033[0;32m'
FAILURE_RED='\033[0;31m'
NC='\033[0m'

success_message="${SUCCESS_GREEN}成功${NC}"
failure_message="${FAILURE_RED}失敗${NC}"

passed_count=0

# 正しくパスすること
test_case=$(./gcd.sh 2 4)
expectation=2
if [[ $test_case -eq $expectation ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $failure_message
  exit 1
fi

test_case=$(./gcd.sh 30 12)
expectation=6
if [[ $test_case -eq $expectation ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $failure_message
  exit 1
fi

# 引数の数エラーが返ること
./gcd.sh 3 | grep "引数は2つ指定してください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $failure_message
  exit 1
fi

./gcd.sh 38 5 10 | grep "引数は2つ指定してください"
if [[ $? -eq 0 ]]; then
  echo -e $success_message
  passed_count=$(expr $passed_count + 1)
else
  echo -e $failure_message
  exit 1
fi

# 自然数エラーが返る
test_case_title=自然数エラーが返る

# 負の数
test_case_subtitle='負の数(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh -67 4 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 小数
test_case_subtitle='小数(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh 112.5 84 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 漢字
test_case_subtitle='漢字(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh 阿 2 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 絵文字
test_case_subtitle='絵文字(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh 蛇 91 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# ひらがな
test_case_subtitle='ひらがな(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh ら 29 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# アルファベット
test_case_subtitle='アルファベット(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh a 41 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 記号
test_case_subtitle='記号(第1引数)'
expectation='引数は自然数としてください'
./gcd.sh . 99 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 負の数
test_case_subtitle='負の数(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 4 -67 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 小数
test_case_subtitle='小数(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 84 112.5 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 漢字
test_case_subtitle='漢字(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 2 阿 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 絵文字
test_case_subtitle='絵文字(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 91 蛇 | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# ひらがな
test_case_subtitle='ひらがな(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 29 ら | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# アルファベット
test_case_subtitle='アルファベット(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 41 a | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi

# 記号
test_case_subtitle='記号(第2引数)'
expectation='引数は自然数としてください'
./gcd.sh 99 . | grep '引数は自然数としてください' > /tmp/$$-result
if [[ $(cat /tmp/$$-result) == $expectation ]]; then
  echo -e "$success_message: $test_case_title > $test_case_subtitle"
  passed_count=$(expr $passed_count + 1)
else
  echo -e "$failure_message: $test_case_title > $test_case_subtitle"
  exit 1
fi


echo $passed_count 個のテストが成功しました
