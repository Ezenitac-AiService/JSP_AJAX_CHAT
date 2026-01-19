const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch({ headless: true });

  // === USER A 세션 ===
  const contextA = await browser.newContext();
  const pageA = await contextA.newPage();
  console.log('🚀 User A: 접속 중...');
  await pageA.goto('http://localhost:8080/join.jsp');
  await pageA.fill('#nick', 'UserA');
  await pageA.click('button:has-text("참여하기")');
  await pageA.waitForURL('**/chat.jsp');
  console.log('✅ User A: 입장 완료');

  // === USER B 세션 ===
  const contextB = await browser.newContext();
  const pageB = await contextB.newPage();
  console.log('🚀 User B: 접속 중...');
  await pageB.goto('http://localhost:8080/join.jsp');
  await pageB.fill('#nick', 'UserB');
  await pageB.click('button:has-text("참여하기")');
  await pageB.waitForURL('**/chat.jsp');
  console.log('✅ User B: 입장 완료');

  // === 대화 시나리오 ===
  const msgA = 'Hello from UserA! (JSON Test)';
  console.log(`💬 User A -> User B: "${msgA}"`);
  await pageA.fill('#msg', msgA);
  await pageA.click('#btnSend');

  // User B가 수신할 때까지 대기
  console.log('⏳ User B: 메시지 수신 대기 중...');
  try {
    await pageB.waitForSelector(`text=${msgA}`, { timeout: 15000 });
    console.log('✅ User B: User A의 메시지 수신 확인!');
  } catch (e) {
    console.error('❌ User B 수신 실패! 스크린샷 저장 중...');
    await pageB.screenshot({ path: 'tests/failure_user_b.png' });
    throw e;
  }

  const msgB = 'Hi UserA! I see your message.';
  console.log(`💬 User B -> User A: "${msgB}"`);
  await pageB.fill('#msg', msgB);
  await pageB.click('#btnSend');

  // User A가 수신할 때까지 대기
  console.log('⏳ User A: 메시지 수신 대기 중...');
  try {
    await pageA.waitForSelector(`text=${msgB}`, { timeout: 15000 });
    console.log('✅ User A: User B의 메시지 수신 확인!');
  } catch (e) {
    console.error('❌ User A 수신 실패! 스크린샷 저장 중...');
    await pageA.screenshot({ path: 'tests/failure_user_a.png' });
    throw e;
  }

  await browser.close();
  console.log('🏁 E2E 테스트 성공!');
})();
