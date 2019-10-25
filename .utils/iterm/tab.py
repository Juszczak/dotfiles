import iterm2
import argparse
import random
import string

parser = argparse.ArgumentParser(description='Open new iTerm tab and execute specified command.')

parser.add_argument('-n', metavar='name', type=str, help='session name', dest='name', nargs='*')
parser.add_argument('-c', metavar='command', type=str, help='command to execute', dest='command', nargs='*')
parser.add_argument('-q', metavar='quit', type=str, help='tab to close', dest='quit', nargs='*')
parser.add_argument('-r', metavar='rename', type=str, help='new tab name', dest='rename', nargs='*')

args = parser.parse_args()

def join(array, sep=' '):
	return sep.join(array)

def first(array):
	return array[0];

def tab_has_session(tab, session_name):
	return session_name in first(tab.sessions).name

def rand_name():
	letters = string.ascii_lowercase
	return ''.join(random.choice(letters) for i in range(3))

async def setup_session(session):
	session.name = args.name
	if args.name != None:
		await session.async_set_name(join(args.name))
	else:
		await session.async_set_name(rand_name())

	if args.command != None:
		await session.async_send_text(
			'{command}\n'.format(
				command = join(args.command)
			)
		)

async def new_tab(window):
	tab = await window.async_create_tab()
	session = first(tab.sessions)
	await setup_session(session)

async def close_tab(window):
	tab_name = join(args.quit)
	if len(tab_name.strip()):
		possible_tabs = list(filter(
			lambda tab: tab_has_session(tab, tab_name), window.tabs)
		)
		if len(possible_tabs):
			try:
				await first(possible_tabs).async_close()
			except:
				print('declined')
		else:
			print('not found')
	else:
		print('closing current tab')
		await window.current_tab.async_close()

async def rename_tab(tab):
	await first(tab.sessions).async_set_name(rand_name())

async def main(connection):
	app = await iterm2.async_get_app(connection)
	window = app.current_terminal_window
	if args.quit != None:
		await close_tab(window)
	else:
		if args.rename != None:
			await rename_tab(window.current_tab)
		else:
			await new_tab(window)

iterm2.run_until_complete(main)
