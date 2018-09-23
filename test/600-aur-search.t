test_description='aur search'

SHARNESS_BUILD_DIRECTORY=${SHARNESS_BUILD_DIRECTORY:-$PWD/aurutils/usr/bin}
. ./sharness/sharness.sh

test_expect_success 'valid search' '
    aur search aurutils >actual &&
    grep -q "^aur/aurutils " actual
'

test_expect_success 'invalid aur search exits with error if invalid #187' '
    test_must_fail aur search .invalid >actual &&
    test_must_be_empty actual
'

test_expect_success 'Exit 2 if too many packages #257' '
    test_expect_code 2 aur search python >out 2>err &&
    echo "==> ERROR: Too many package results." >expect &&
    test_must_be_empty out &&
    test_cmp err expect
'
test_done
