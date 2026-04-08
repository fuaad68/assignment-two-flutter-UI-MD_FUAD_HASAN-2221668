import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Two UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F5F9),
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5C56F0)),
      ),
      home: const MainPagerScreen(),
    );
  }
}

class MainPagerScreen extends StatefulWidget {
  const MainPagerScreen({super.key});

  @override
  State<MainPagerScreen> createState() => _MainPagerScreenState();
}

class _MainPagerScreenState extends State<MainPagerScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          DashboardPage(),
          ReportsPage(),
          CardsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 16,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: NavigationBar(
            backgroundColor: Colors.white,
            indicatorColor: const Color(0x1E5C56F0),
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onTap,
            labelBehavior:
                NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.analytics_outlined),
                label: 'Reports',
              ),
              NavigationDestination(
                icon: Icon(Icons.credit_card_outlined),
                label: 'Cards',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(name: 'MD. FUAD HASAN'),
            const SizedBox(height: 18),
            const _BalanceCard(),
            const SizedBox(height: 18),
            Row(
              children: const [
                Expanded(
                  child: _ActionTile(
                    icon: Icons.swap_horiz,
                    label: 'Transfer',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ActionTile(
                    icon: Icons.account_balance_wallet_outlined,
                    label: 'Pay Bills',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ActionTile(
                    icon: Icons.link,
                    label: 'Invest',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 28,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E2530),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Color(0xFF5C56F0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const _TransactionTile(
              icon: Icons.movie,
              title: 'Netflix Subscription',
              subtitle: 'Entertainment · Today',
              amount: '\$19.99',
              expense: true,
            ),
            const _TransactionTile(
              icon: Icons.coffee,
              title: 'Coffee Shop',
              subtitle: 'Food & Drink · Today',
              amount: '\$4.50',
              expense: true,
            ),
            const _TransactionTile(
              icon: Icons.payments_outlined,
              title: 'Salary Deposit',
              subtitle: 'Income · Yesterday',
              amount: '\$3500.00',
              expense: false,
            ),
            const _TransactionTile(
              icon: Icons.shopping_cart_outlined,
              title: 'Grocery Store',
              subtitle: 'Shopping · Yesterday',
              amount: '\$55.80',
              expense: true,
            ),
            const _TransactionTile(
              icon: Icons.shopping_bag_outlined,
              title: 'Amazon Purchase',
              subtitle: 'Shopping · 2 days ago',
              amount: '\$120.45',
              expense: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            AppHeader(name: 'MD. FUAD HASAN'),
            SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Text(
                  'Reports Page',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E2530),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(name: 'MD. FUAD HASAN'),
            const SizedBox(height: 22),
            const Text(
              'My Cards',
              style: TextStyle(
                fontSize: 36,
                height: 1,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2530),
              ),
            ),
            const SizedBox(height: 16),
            const _CardPanel(),
            const SizedBox(height: 18),
            Row(
              children: const [
                Expanded(
                  child: _ActionTile(
                    icon: Icons.close,
                    label: 'Block',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ActionTile(
                    icon: Icons.credit_card,
                    label: 'Details',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ActionTile(
                    icon: Icons.info_outline,
                    label: 'Limit',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Linked Accounts',
              style: TextStyle(
                fontSize: 26,
                height: 1,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2530),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE8EAF1)),
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFE8EAFE),
                    child: Text(
                      'F',
                      style: TextStyle(
                        color: Color(0xFF5C56F0),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shared Savings',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E2530),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '\$5,500.00',
                          style: TextStyle(
                            color: Color(0xFF8B91A2),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFFB1B8C9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(name: 'MD. FUAD HASAN'),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 38,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2530),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFE5E8FF),
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Color(0xFF5C56F0),
                  child: Text(
                    'MF',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const _ProfileInfoCard(
              title: 'Name',
              value: 'Md. Fuad Hasan',
            ),
            const SizedBox(height: 10),
            const _ProfileInfoCard(
              title: 'Student ID',
              value: '2221668',
            ),
            const SizedBox(height: 10),
            const _ProfileInfoCard(
              title: 'Email',
              value: '2221668@iub.edu.bd',
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio / Story',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E2530),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'I\'m currently studying at IUB, in the final year, with a lot of projects and dreams in my head which are depressing me. Love playing games and just hate coding.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.55,
                      color: Color(0xFF555E73),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundColor: Color(0xFF5C56F0),
          child: Text(
            'F',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back,',
                style: TextStyle(
                  color: Color(0xFF9BA1B0),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF1E2530),
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F7),
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Color(0xFF5B6275),
                size: 18,
              ),
            ),
            Positioned(
              top: -1,
              right: -1,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6767),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5D5AF5), Color(0xFF4A45DA)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x395C56F0),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Color(0xDFFFFFFF),
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.credit_card,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: '\$8,945',
                  style: TextStyle(
                    fontSize: 46,
                    height: 1,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: '.32',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0x52FFFFFF), height: 1),
          const SizedBox(height: 9),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Savings: \$5,500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                'Last 30 days: +\$300',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, color: Colors.white, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE7E9FE),
            ),
            child: Icon(icon, color: const Color(0xFF5C56F0), size: 16),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF343A49),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.expense,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EAF1)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF0F2F7),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF596177)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1E2530),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8B91A2),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            expense ? '-$amount' : '+$amount',
            style: TextStyle(
              color: expense ? const Color(0xFFFF4A4A) : const Color(0xFF16B64F),
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardPanel extends StatelessWidget {
  const _CardPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 176,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1D2E47), Color(0xFF111E35), Color(0xFF152A4A)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 34,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC928),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const Text(
                'BANK',
                style: TextStyle(
                  color: Color(0xFFD8DEEA),
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            '4567  ****  ****  1234',
            style: TextStyle(
              color: Colors.white,
              fontSize: 31,
              height: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CARD HOLDER',
                    style: TextStyle(
                      color: Color(0xFF9CAACA),
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'MD. FUAD HASAN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'EXPIRES',
                    style: TextStyle(
                      color: Color(0xFF9CAACA),
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '12/28',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  const _ProfileInfoCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF8A91A2),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              height: 1,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E2530),
            ),
          ),
        ],
      ),
    );
  }
}
