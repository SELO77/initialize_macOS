# "맥 포맷 후 초기 세팅" 프로젝트 기록서

이번에 새로운 직장으로 이직을 하게 되었다. 나는 이직할때 포맷을 하는 풍습? 이 있고, 이번에도 역시나 한치의 망설임도 없이 포맷을 진행했다. 포맷을 진행한 후 항상 비슷한 과정의 컴퓨터 세팅과정을 갖는다. 개인적으로 포맷된 컴퓨터를 셋팅하는 과정은 재미 있다. 누구나 그렇지만 나는 항상 처음에 과도하게 의욕이 넘친다... 그래서 안하던 새로운 시도도 하곤한다. 한번은 컴퓨터의 [MBR](https://ko.wikipedia.org/wiki/%EB%A7%88%EC%8A%A4%ED%84%B0_%EB%B6%80%ED%8A%B8_%EB%A0%88%EC%BD%94%EB%93%9C)를 날려먹은 적도 있다. 2틀정도 고생해서 복구를 했지만 상당히 고통받았던 경험도 있다. 아무튼 컴퓨터를 세팅하는 과정중 대부분은 반복적으로 항상 일어나게 되고, 이를 이미지를 구워놓고나 맥같은 경우는 타임머신을 이용해서 이미지 복원을 이용할 수 있다. 하지만 개인적으로 스크립트로 이러한 초기세팅과정을 버전관리하고 싶었고, 지난 포맷부터 허접하지만 [github repo] (https://github.com/SELO77/initialize_mac)에 관리를 결심했다. 하지만 엉망진창인 코드와 폴더덕분에 실패했고, 이번에 새로운 V2를 만들어보려 한다.

## 프로젝트 정의
항상 설치되는 Mac Application, CLI Application, Development environment set up을 큰 요구사항으로 본다. 각 하위 목록은 설정파일을 읽어 설치한다.

### 요구사항
* mac application install
	* chrome
	* caffeine
	* iterm2
	* sourcetree - git GUI
	* duet - multi monitor supporting for Apple devices
	* macdown - simple markdown editor
	* sublime-text
	* slack
	* alfred
		* load preference
			* workflow
				* naver english dictionary
				* oxforld english dictionary
				* google bookmark search
			
* development environment set up
	*  bash
		*  [bash-it](https://github.com/Bash-it/bash-it)
	*  python dev environment (pyenv, pyenv-virtualenv ...)
	*  git config (account setting, ignore ...)

### 용어정의 
* 요구사항 타입 : 위에서 최상위 요구사항 3가지 (eg. mac, cli ...)
 
### 모듈화
* 요구사항 타입에 따라 독립적으로 실행될 수 있도록 모듈화 진행 및 폴더구조 정의

### 도구정의
* 대부분의 Mac에서 사용되는 GUI 혹은 CLI App 은 `brew`를 통해 설치 가능하다.,
* [`brew cask`](https://caskroom.github.io/) Mac Apps 설치
* Using BASH Script, default shell of the UNIXs

## 프로젝트 진행
### 이슈사항
* bash script간 참조시 PATH 엉켜 정상적으로 import 하지 못하는 문제 발생 
	* 같은 폴더(PATH)안에 있을시 문제가 없지만, 참조하는 스크립트 간에 PATH가 다를시 참조 문제 발생가능.
* function return 문제. 다음과 같은 방법으로 local value 셋팅 후 echo function 호출로 return 을 구현

```bash
function read_line_by_line {
    local value
    while IFS='' read -r line || [[ -n "$line" ]];
        do
            value="$value $line"
    done < "$1"
    echo "$value"
}

apps=$(read_line_by_line mac_apps.txt)
```



## REFERENCE
* [BASH Programming - Introduction HOW-TO](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc5)