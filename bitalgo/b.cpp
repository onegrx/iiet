#include <cstdio>
typedef long long int ll;

ll gcd(ll a, ll b) {
  ll c;
  while(b != 0) {
    c = b;
    b = a % b;
    a = c;
  }  
  return a;
}

int main() {
  int Z;
  scanf("%d", &Z);
  ll a, b, c;
  while(Z--) {
    scanf("%lld %lld", &a, &b);
    c = gcd(a, b);
    printf("%lld %lld\n", c, a*b/c);
    
  }
  return 0;
}
