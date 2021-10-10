/**
 * @description 引用
 * @author tonghan
 */
import Editor from '../../editor/index';
import BtnMenu from '../menu-constructors/BtnMenu';
import { MenuActive } from '../menu-constructors/Menu';
declare class Quote extends BtnMenu implements MenuActive {
    constructor(editor: Editor);
    /**
     * 点击事件
     */
    clickHandler(): void;
    /**
     * 尝试修改菜单激活状态
     */
    tryChangeActive(): void;
}
export default Quote;
