#include <bits/stdc++.h>
using namespace std;

#ifdef LOCAL
#define eprint(x) cerr << #x << " = " << x << endl
#else
#define eprint(x) 42
#endif

#define endl '\n'
using ll = long long;

ll manacher(const string &s) {
    int n = s.size();
    ll res = 0;
    vector<int> d1(n);
    for (int i = 0, l = 0, r = -1; i < n; i++) {
        int k = (i <= r) ? min(d1[l + (r - i)], r - i + 1) : 1;
        while (0 <= i - k && i + k < n && s[i - k] == s[i + k])
            k++;
        d1[i] = k--;
        if (i + k > r) {
            l = i - k;
            r = i + k;
        }
        res += d1[i];
    }
    vector<int> d2(n);
    for (int i = 0, l = 0, r = -1; i < n; i++) {
        int k = (i <= r) ? min(d2[l + (r - i) + 1], r - i + 1) : 0;
        while (0 <= i - k - 1 && i + k < n && s[i - k - 1] == s[i + k])
            k++;
        d2[i] = k--;
        if (i + k > r) {
            l = i - k - 1;
            r = i + k;
        }
        res += d2[i];
    }
    return res;
}

int main() {
    freopen("palindrome.in", "r", stdin);
    freopen("palindrome.out", "w", stdout);
    
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    
    string s;
    cin >> s;
    int n = s.size();
    cout << manacher(s) - n << endl;
}